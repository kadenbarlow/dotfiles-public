global.pbcopy = function pbcopy(string) {
  const proc = require("child_process").spawn("pbcopy");
  proc.stdin.write(string);
  proc.stdin.end();
  return string;
};
