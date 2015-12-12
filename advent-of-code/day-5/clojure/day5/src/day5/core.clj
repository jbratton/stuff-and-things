(ns day5.core
  (:gen-class))

(defn nice?
  [word]
  (reduce #(and %1 %2)
          [(>= (count (re-seq #"[aeiou]" word)) 3)
           (re-find #"(.)\1" word)
           (not (re-find #"(ab|cd|pq|xy)" word))]))

(defn part2-nice?
  [word]
  (reduce #(and %1 %2)
          [(re-find #"(.{2}).*\1" word)
           (re-find #"(.).\1" word)]))

(defn part1
  [word-list]
  (count (filter nice? word-list)))

(defn part2
  [word-list]
  (count (filter part2-nice? word-list)))

(defn -main
  [input-file]
  (let [word-list (clojure.string/split-lines (slurp input-file))]
    (println (str "part 1: " (part1 word-list)))
    (println (str "part 2: " (part2 word-list)))))
