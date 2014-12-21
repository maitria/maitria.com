(ns make-maitria.core
  (:require [clostache.parser :refer :all])
  (:gen-class))

(defn source-file
  [destination]
  (str destination ".mustache"))

(defn -main
  [& args]
  (spit "site/index.html" (render-resource (source-file "index.html") {}))
  (spit "site/events/intro-to-meditation.html" (render-resource "events/intro-to-meditation.html.mustache")))
