#! /usr/bin/env node

import fs from "fs"
import child_process from "child_process"

const fileContents = fs.readFileSync("/tmp/git-comment.md", "utf8")
const commitSha = fs.readFileSync("/tmp/git-comment-sha.txt", "utf8").trim()
const prNumber = fs.readFileSync("/tmp/git-comment-pr.txt", "utf8").trim()
const filePath = fileContents.match(/File Path: (.*) --/)[1]
const lineNumber = fileContents.match(/Line Number: (\d*) --/)[1]
const comment = fileContents.split("\n").slice(3).join("\n").trim()
const token = child_process.execSync("gh auth token").toString().trim()
const url =
  child_process
    .execSync(`gh pr view ${prNumber} --json url | jq \".url\"`)
    .toString()
    .trim()
    .replace('"', "")
    .replace("https://github.com", "https://api.github.com/repos")
    .replace("pull", "pulls") + "/comments"

const myHeaders = new Headers()
myHeaders.append("Content-Type", "application/json")
myHeaders.append("Authorization", `token ${token}`)

const raw = JSON.stringify({
  body: comment,
  path: filePath,
  commit_id: commitSha,
  line: parseInt(lineNumber),
  side: "RIGHT",
})

const requestOptions = {
  method: "POST",
  headers: myHeaders,
  body: raw,
  redirect: "follow",
}

fetch(url, requestOptions)
  .then((response) => response.text())
  .then((result) => console.log(result))
  .catch((error) => console.error(error))
