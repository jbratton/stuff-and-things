(ns day2.core
  (:gen-class))

(defn parse-input
  [input]
  (let [input-lines (clojure.string/split-lines input)]
  (map (fn [line] (map #(Integer/parseInt %) (clojure.string/split line #"x"))) input-lines)))

(defn paper-for-gift
  [lwh]
  (let [[l w h] lwh
        areas (list (* l w) (* w h) (* h l))]
    (+ (* 2 (reduce + areas)) (apply min areas))))
    
(defn ribbon-for-gift
  [lwh]
  (let [[l w h] lwh
        two-shortest-sides (take 2 (sort lwh))]
    (+ (* 2 (reduce + two-shortest-sides)) (* l w h))))

(defn part-1
  [parsed-input]
  (reduce + (map paper-for-gift parsed-input)))

(defn part-2
  [parsed-input]
  (reduce + (map ribbon-for-gift parsed-input)))

(defn -main
  [input-file]
  (let [parsed-input (parse-input (slurp input-file))]
    (println (str "part 1: " (part-1 parsed-input)))
    (println (str "part 2: " (part-2 parsed-input)))))
