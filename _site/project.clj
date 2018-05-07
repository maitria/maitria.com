(defproject make-maitria "0.1.0-SNAPSHOT"
  :description "app to create static maitria.com site"
  :url "http://github.com/maitria/maitria.com"
  :dependencies [[org.clojure/clojure "1.6.0"] 
                 [de.ubercode.clostache/clostache "1.4.0"]]
  :main ^:skip-aot make-maitria.core
  :target-path "target/%s"
  :profiles {:uberjar {:aot :all}})
