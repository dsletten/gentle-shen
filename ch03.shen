\\   Hey, Emacs, this is a -*- Mode: Shen -*- file!
\\
\\   If you give someone Fortran, he has Fortran. If you give someone Lisp, he has any language he pleases.
\\   -- Guy Steele
\\
\\   Name:               ch03.shen
\\
\\   Started:            Sun Dec 15 03:34:27 2024
\\   Modifications:
\\
\\   Purpose:
\\
\\
\\
\\   Calling Sequence:
\\
\\
\\   Inputs:
\\
\\   Outputs:
\\
\\   Example:
\\
\\   Notes:
\\
\\

\\
\\    3.5
\\
(define half
  X -> (/ X 2))

(define onemore?
  X Y -> (= X (+ Y 1)))

\\
\\    3.6
\\
(define hypotenuse
  A B -> (sqrt (+ (sq A) (sq B))))

(define num-list?
  [] -> true
  [X|Xs] -> (and (number? X) (num-list? Xs)))

(define pythag
  Xs -> (sqrt (foldl (fn +) 0 (map (fn sq) Xs))))

\* (defmacro pythag-macro *\
\*   [pythag A|B] -> [pythag [A|B]]) *\

(define pythag
  Xs -> (sqrt (foldl (/. X Y (+ X Y)) 0 (map (lambda X (sq X)) Xs))))

\\
\\    3.7
\\
(define miles-per-gallon
  Initial Final Gallons -> (/ (- Final Initial) Gallons))

\\
\\    3.11
\\
(define longer-than?
  L1 L2 -> (> (length L1) (length L2)))

(define longer-than?
  [] _ -> false
  _ [] -> true
  [_|T1] [_|T2] -> (longer-than? T1 T2))

\* (15-) (track longer-than?) *\
\* longer-than? *\

\* (16-) (longer-than? [a b c] [a b]) *\

\*  <1> Inputs to longer-than?  *\
\*  [a b c], [a b],  ==> *\

\*   <2> Inputs to longer-than?  *\
\*   [b c], [b],  ==> *\

\*    <3> Inputs to longer-than?  *\
\*    [c], [],  ==> *\

\*    <3> Output from longer-than?  *\
\*    ==> true *\

\*   <2> Output from longer-than?  *\
\*   ==> true *\

\*  <1> Output from longer-than?  *\
\*  ==> true *\
\* true *\

\* (17-) (untrack longer-than?) *\
\* longer-than? *\

\\
\\    3.12
\\
(define add-length
  Xs -> [(length Xs)|Xs])

\\
\\    3.22d
\\
(define first?
  Sym L -> (= Sym (head L)))

\\
\\    3.22e
\\
(define mid-add
  [A B C] -> [A (+ B 1) C])

\\
\\    3.22f
\\
(define convert
  Scale Temp -> (- (* Scale (+ Temp 40)) 40))

(define f->c
  F -> (convert (r->n (r# 5 9)) F))

(define c->f
  C -> (convert (r->n (r# 9 5)) C))

(define convert
  M -> (/. Temp
           (- (* (+ Temp 40) M) 40)))

\\    Don't need FUNCALL
(define f->c
  F -> ((convert (/ 5 9)) F))

(define c->f
  C -> ((convert (/ 9 5)) C))
