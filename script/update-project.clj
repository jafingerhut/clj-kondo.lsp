#!/bin/sh
#_(
   "exec" "clojure" "-Sdeps" "{:deps,{selmer,{:mvn/version,\"1.12.17\"},clj-kondo,{:mvn/version,\"2020.05.09\"}}}" "$0"
   )

(require '[selmer.parser :as p])
(require '[clojure.java.io :as io])
(require '[clojure.string :as str])

(def version (str/trim (slurp (io/resource "CLJ_KONDO_VERSION"))))

(spit "server/project.clj"
      (str ";; GENERATED by script/update-project.clj, DO NOT EDIT\n"
           ";; To change dependencies, update deps.edn and run script/update-project.clj.\n"
           ";; To change other things, edit project.template.clj and run script/update-project.clj.\n"
           "\n"
           (p/render (slurp (io/file "server/project.clj.template"))
                     {:version version})))
