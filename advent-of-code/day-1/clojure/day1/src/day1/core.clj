(ns day1.core
  (:gen-class))

(defn part-1
  [input]
  (loop [remaining-directions (clojure.string/split input #"")
         current-floor 0]
    (cond
      (empty? remaining-directions) current-floor
      (= (first remaining-directions) "(") (recur (rest remaining-directions) (+ current-floor 1))
      (= (first remaining-directions) ")") (recur (rest remaining-directions) (- current-floor 1))
      :else (recur (rest remaining-directions) current-floor))
  )
)

(defn part-2
  [input]
  (loop [remaining-directions (clojure.string/split input #"")
         current-floor 0
         current-direction-position 0]
    (cond
      (< current-floor 0) current-direction-position
      (empty? remaining-directions) current-direction-position
      (= (first remaining-directions) "(") (recur (rest remaining-directions) (+ current-floor 1) (+ current-direction-position 1))
      (= (first remaining-directions) ")") (recur (rest remaining-directions) (- current-floor 1) (+ current-direction-position 1))
      :else (recur (rest remaining-directions) current-floor (+ current-direction-position 1)))
  )
)

(defn -main
  [input-file]
  (let [input (slurp input-file)]
    (println (str "part 1: " (part-1 input)))
    (println (str "part 2: " (part-2 input)))
  )
)
