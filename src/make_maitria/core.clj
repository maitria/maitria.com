(ns make-maitria.core
  (:require [clostache.parser :refer :all])
  (:gen-class))

(defn -main
  [& args]
  (spit "site/index.html" (render-resource "index.html.mustache" {}))
  (spit "site/events/intro-to-meditation.html" (render-resource "intro-to-meditation.html.mustache")))
