(ns make-maitria.core
  (:require [clostache.parser :refer :all])
  (:gen-class))

(defn source-file
  [page-path]
  (str page-path ".mustache"))

(defn destination-file
  [page-path]
  (str "site/" page-path))

(defn generate
  [page-path]
  (spit (destination-file page-path) (render-resource (source-file page-path) {})))

(defn -main
  [& args]
  (generate "index.html")
  (spit (destination-file "events/intro-to-meditation.html") (render-resource (source-file "events/intro-to-meditation.html"))))
