;;;#lang racket
;;; Continue: Web Applications in Racket

;;; Getting started
#lang web-server/insta
(define (start request)
  (response/xexpr
   '(html
     (head (title "My Page"))
     (body (h1 "Here are some words")))))


;; Test of post

;;(struct post ( "New Post" "Here are some more words"))

;; As no suprise this doesn't work

;; Tried blog
;;(define BLOG (list (post "First Post!"
;;                         "Hey, this is my first post!")))

;; which failed as well

(define xexpr/c
  (flat-rec-contract
   xexpr
   (or/c string?
         (cons/c symbol? (listof xexpr))
         (cons/c symbol?
                 (cons/c (listof (list/c symbol? string? ))
                         (listof xexpr))))))

(list 'html (list 'head (list 'title "Some title"))
       (list 'body (list 'p "This is a simple static page.")))
'(html (head (title "Some title"))
       (body (p "This is a simple static page.")))
; render-greeting: string -> response
; Consumes a name, and produces a dynamic response.
(define (render-greeting a-name)
  (response/xexpr
   `(html (head (title "Welcome"))
          (body (p ,(string-append "Hello " a-name))))))
;;Exercise. Write a function that consumes a post and produces an X-expression representing that content.
;;(render-post (post "First post!" "This is a first post."))

'(div ((class "post")) "First post!" (p "This is a first post."))

; render-as-itemized-list: (listof xexpr) -> xexpr
; Consumes a list of items, and produces a rendering
; as an unordered list.
(define (render-as-itemized-list fragments)
  `(ul ,@(map render-as-item fragments)))
 
; render-as-item: xexpr -> xexpr
; Consumes an xexpr, and produces a rendering
; as a list item.
(define (render-as-item a-fragment)
  `(li ,a-fragment))