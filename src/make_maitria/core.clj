(ns make-maitria.core
  (:require [clostache.parser :refer :all])
  (:gen-class))

(def pages ["index.html"
            "events/intro-to-meditation.html"])

(defn source-file
  [page]
  (str page ".mustache"))

(defn destination-file
  [page]
  (str "site/" page))

(defn generate
  [page]
  (spit (destination-file page) (render-resource (source-file page) {})))

(defn -main
  [& args]
  (doseq [page pages]
    (generate page)))
