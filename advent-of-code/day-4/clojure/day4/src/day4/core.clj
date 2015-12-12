(ns day4.core
  (:gen-class))
(require 'digest)

(defn gen-md5
  [n]
  (let [secret-key "iwrupvqb"]
    (digest/md5 (str secret-key n))))

(defn find-md5-with-n-zereos
  [n]
  (loop [current-index 0]
    (if (= (repeat n \0) (take n (gen-md5 current-index)))
      current-index
      (recur (inc current-index)))))

(defn -main
  [& args]
  (println (str "part 1: " (find-md5-with-n-zereos 5)))
  (println (str "part 2: " (find-md5-with-n-zereos 6))))
