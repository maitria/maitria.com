(ns make-maitria.core
  (:require [clostache.parser :refer :all]
            [clojure.java.io :as io])
  (:gen-class))

(def pages ["index.html"
            "events/intro-to-meditation.html"
            "work-with-us.html"
            "podcast.html"
            "yourself.html"])

(defn source-file
  [page]
  (str page ".mustache"))

(defn destination-file
  [page]
  (str "site/" page))

(defn generate
  [page]
  (let [partials {:header (slurp (io/resource "partials/header.mustache"))
                  :events (slurp (io/resource "partials/events.mustache"))
                  :conference (slurp (io/resource "partials/conference.mustache"))
                  :about (slurp (io/resource "partials/about.mustache"))
                  :contact (slurp (io/resource "partials/contact.mustache"))
                  :swag (slurp (io/resource "partials/swag.mustache"))
                  :work (slurp (io/resource "partials/work.mustache"))
                  :work-highlights (slurp (io/resource "partials/work-highlights.mustache"))
                  :yourself (slurp (io/resource "partials/yourself.mustache"))
                  :courses-practice (slurp (io/resource "partials/courses-practice.mustache"))
                  :individual-coaching (slurp (io/resource "partials/individual-coaching.mustache"))}
        variables {:there-is-currently "no data needed"}
        content (render-resource (source-file page) variables partials)]
    (spit (destination-file page) content)))

(defn -main
  [& args]
  (doseq [page pages]
    (generate page)))
