(ns day2.core-test
  (:require [clojure.test :refer :all]
            [day2.core :refer :all]))

(deftest test-parse-input
  (testing "1x2x3"
    (is (= (list (list 1 2 3)) (parse-input "1x2x3"))))
  (testing "1x2x3\n17x18x19"
    (is (= (list (list 1 2 3) (list 17 18 19)) (parse-input "1x2x3\n17x18x19")))))

(deftest test-paper-for-gift
  (testing "(list 2 3 4)"
    (is (= 58 (paper-for-gift (list 2 3 4)))))
  (testing "(list 1 1 10)"
    (is (= 43 (paper-for-gift (list 1 1 10))))))

(deftest test-ribbon-for-gift
  (testing "(list 2 3 4)"
    (is (= 34 (ribbon-for-gift (list 2 3 4)))))
  (testing "(list 1 1 10)"
    (is (= 14 (ribbon-for-gift (list 1 1 10))))))
