(ns make-maitria.core
  (:require [clostache.parser :refer :all]
            [clojure.java.io :as io])
  (:gen-class))

(def pages ["index.html"
            "work-with-us.html"
            "podcast.html"
            "yourself.html"
            "coaching.html"
            "speaking.html"
            "coc.html"])

(defn source-file
  [page]
  (str page ".mustache"))

(defn destination-file
  [page]
  (str "site/" page))

(defn generate
  [page]
  (let [partials {:header (slurp (io/resource "partials/header.mustache"))
                  :conference (slurp (io/resource "partials/conference.mustache"))
                  :about (slurp (io/resource "partials/about.mustache"))
                  :contact (slurp (io/resource "partials/contact.mustache"))
                  :swag (slurp (io/resource "partials/swag.mustache"))
                  :work (slurp (io/resource "partials/work.mustache"))
                  :yourself (slurp (io/resource "partials/yourself.mustache"))
                  :etl (slurp (io/resource "partials/etl.mustache"))
                  :individual-coaching (slurp (io/resource "partials/individual-coaching.mustache"))
                  :coaching (slurp (io/resource "partials/coaching.mustache"))
                  :talks (slurp (io/resource "partials/talks.mustache"))}
        variables {:there-is-currently "no data needed"}
        content (render-resource (source-file page) variables partials)]
    (spit (destination-file page) content)))

(defn -main
  [& args]
  (doseq [page pages]
    (generate page)))
