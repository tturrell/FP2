# Final Project Assignment 2: Exploration (FP2)
DUE Wednesday, March 23, 2016


## My Library: (Continue: Web Applications in Racket)
My name:Tyrone Turrell

Getting started
```racket
#lang web-server/insta
(define (start request)
  (response/xexpr
   '(html
     (head (title "My Page"))
     (body (h1 "Here are some words")))))
```
![Web Site](https://github.com/tturrell/FP2/blob/master/2_2.jpg)
Test of post

`(struct post ( "New Post" "Here are some more words"))`
As no suprise this doesn't work

Tried blog
`(define BLOG (list (post "First Post!"  "Hey, this is my first post!")))`

which failed as well

There is an attempt to follow the next step.
```
(define xexpr/c
  (flat-rec-contract
   xexpr
   (or/c string?
         (cons/c symbol? (listof xexpr))
         (cons/c symbol?
                 (cons/c (listof (list/c symbol? string? ))
                         (listof xexpr))))))
```
And some subsequent steps and explaination of how things work that mainly gets printed in the racket output
but doesn't not make any difference to the the web application.

![Racket Output](https://github.com/tturrell/FP2/blob/master/2_1.jpg)
```racket
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

```

Exercise. Write a function that consumes a post and produces an X-expression representing that content.
It is left as an exercise to do anything useful at this stage- so I stop.
```racket
;;(render-post (post "First post!" "This is a first post."))

'(div ((class "post")) "First post!" (p "This is a first post."))
```
```racket
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
  ```
  There is no reason to do more until I can solve the initial puzzles-- if I even need to.
  
  
## Project Schedule
This is the first part of a larger project. The final project schedule is [here][schedule]

<!-- Links -->
[schedule]: https://github.com/oplS16projects/FP-Schedule
[markdown]: https://help.github.com/articles/markdown-basics/
[forking]: https://guides.github.com/activities/forking/
[ref-clone]: http://gitref.org/creating/#clone
[ref-commit]: http://gitref.org/basic/#commit
[ref-push]: http://gitref.org/remotes/#push
[pull-request]: https://help.github.com/articles/creating-a-pull-request
