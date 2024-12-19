\\   Hey, Emacs, this is a -*- Mode: Shen -*- file!
\\
\\   If you give someone Fortran, he has Fortran. If you give someone Lisp, he has any language he pleases.
\\   -- Guy Steele
\\
\\   Name:               ch04.shen
\\
\\   Started:            Sun Dec 15 18:49:42 2024
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
\\    4.1
\\
(define make-even
  N -> (if (odd? N) (+ N 1) N))

\\
\\    4.2
\\
(define further
  X -> (cases (positive? X) (+ X 1)
              (negative? X) (- X 1)
              true X))

\\
\\    4.4
\\
(define ordered
  A B -> [B A] where (< B A)
  A B -> [A B])

\\
\\    4.8
\\
(define emphasize
  [good|More] -> [great|More]
  [bad|More] -> [awful|More]
  S -> [very|S])

\\
\\    4.9
\\
(define make-odd
  N -> (+ N (mod (+ N 1) 2)))

\\
\\    4.10
\\
\\    (< Min Max) ??
(define constrain
  X Min _ -> Min where (< X Min)
  X _ Max -> Max where (> X Max)
  X _ _ -> X)

\\
\\    4.11
\\
(define first-zero
  [0 _ _] -> first
  [_ 0 _] -> second
  [_ _ 0] -> third
  _       -> none)

\\
\\    4.12
\\
(define cycle
  N Limit -> (+ (mod N Limit) 1))

\\
\\    4.13
\\
(define how-compute
  Op1 Op2 Val -> sum-of where (= Val (+ Op1 Op2))
  Op1 Op2 Val -> product-of where (= Val (* Op1 Op2))
  _ _ _ -> beats-me)

(define how-alike
  X X -> the-same
  A B -> both-odd where (and (odd? A) (odd? B))
  A B -> both-even where (and (even? A) (even? B))
  A B -> both-negative where (and (negative? A) (negative? B))
  A B -> both-positive where (and (positive? A) (positive? B))
  _ _ -> not-alike)

(define same-sign
  0 0 -> true
  X Y -> true where (and (negative? X) (negative? Y))
  X Y -> true where (and (positive? X) (positive? Y))
  _ _ -> false)

(define same-sign
  X Y -> (some? (/. F (and (F X) (F Y)))
                [(lambda X (= X 0)) (fn positive?) (fn negative?)]))

(define same-sign
  X Y -> (cases (= X 0) (= Y 0)
                (negative? X) (negative? Y)
                (positive? X) (positive? Y)
                true false))

(define same-sign
  0 0 -> true
  X Y -> (positive? (* X Y)))

(define same-sign
  X Y -> (= (maths.sign X) (maths.sign Y)))

\\
\\    4.16
\\
(define fancy
  X -> (sq X) where (and (odd? X) (positive? X))
  X -> (* 2 X) where (and (odd? X) (negative? X))
  X -> (/ X 2))

(define fancy-factor
  X -> X where (and (odd? X) (positive? X))
  X -> 2 where (and (odd? X) (negative? X))
  X -> (/ 1 2))

(define fancy
  X -> (* X (fancy-factor X)))

\\
\\    4.17
\\
(define categorize
  boy child -> true
  girl child -> true
  man adult -> true
  woman adult -> true
  _ _ -> false)

\\
\\    4.18
\\
(define beats
  rock scissors -> true
  scissors paper -> true
  paper rock -> true
  _ _ -> false)

(define play
  X X -> tie
  A B -> first-wins where (beats A B)
  A B -> second-wins where (beats B A))

\\     Doesn't work???
\* (define beats *\
\*   rock -> scissors *\
\*   scissors -> paper *\
\*   paper -> rock) *\

\* (define play *\
\*   X X -> tie *\
\*   A (beats A) -> first-wins *\
\*   (beats B) B -> second-wins) *\

\\
\\    4.20
\\
(define compare
  X X -> numbers-are-the-same
  X Y -> first-is-smaller where (< X Y)
  _ _ -> first-is-bigger)

(define compare
  X Y -> (cases (= X Y) numbers-are-the-same
                (< X Y) first-is-smaller
                true first-is-bigger))

(define compare
  X Y -> (if (= X Y)
             numbers-are-the-same
             (if (< X Y)
                 first-is-smaller
                 first-is-bigger)))

