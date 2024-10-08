; extends
((template_string) @injection.content
  (#lua-match? @injection.content "`.*{.*\n.*}\n*`")
  (#set! injection.include-children)
  (#set! injection.language "graphql"))

; Trying the above regex if I need to be more specific maybe I'll use these two
; ((template_string) @injection.content
;   (#lua-match? @injection.content "^.*mutation.*{.*}")
;   (#offset! @injection.content 0 1 0 -1)
;   (#set! injection.include-children)
;   (#set! injection.language "graphql"))
; ((template_string) @injection.content
;   (#lua-match? @injection.content "^.*query.*{.*}")
;   (#offset! @injection.content 0 1 0 -1)
;   (#set! injection.include-children)
;   (#set! injection.language "graphql"))
