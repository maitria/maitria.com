(ns make-maitria.core
  (:require [clostache.parser :refer :all])
  (:gen-class))

(defn source-file
  [pagename]
  (str pagename ".mustache"))

(defn destination-file
  [pagename]
  (str "site/" pagename))

(defn -main
  [& args]
  (spit (destination-file "index.html") (render-resource (source-file "index.html") {}))
  (spit (destination-file "events/intro-to-meditation.html") (render-resource (source-file "events/intro-to-meditation.html"))))
