(ns day3.core
  (:gen-class))

(def direction-map {\^ (fn [coord] [(first coord) (inc (second coord))])
                    \v (fn [coord] [(first coord) (dec (second coord))])
                    \> (fn [coord] [(inc (first coord)) (second coord)])
                    \< (fn [coord] [(dec (first coord)) (second coord)])})

(defn part1
  [input]
  (count
    (loop [directions input
           current-house [0 0]
           visited-houses #{current-house}]
      (if (empty? directions)
        visited-houses
        (let [next-house ((get direction-map (first directions)) current-house)]
          (recur (rest directions) next-house (conj visited-houses next-house)))))))

(defn part2
  [input]
  (count
    (loop [directions input
           current-s-house [0 0]
           current-r-house [0 0]
           visited-houses #{current-s-house}]
      (if (empty? directions)
        visited-houses
        (let [next-s-house ((get direction-map (first directions)) current-s-house)
              next-r-house ((get direction-map (second directions)) current-r-house)]
          (recur (nthrest directions 2)
                 next-s-house next-r-house (conj visited-houses next-s-house next-r-house)))))))

(defn -main
  [input-file]
  (let [input (slurp input-file)]
    (println "part 1: " (part1 input))
    (println "part 2: " (part2 input))))
