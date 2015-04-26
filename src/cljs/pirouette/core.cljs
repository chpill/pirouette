(ns pirouette.core
    (:require [rum :as r]))

(enable-console-print!)

(def ticket
  {:creator "Geoge Abidbol"
   :description "Pirouette will ease your pain working with clojurescript"})

(r/defc ticket-view [post]
  [:blockquote (:description ticket) [:cite (:creator post)]])

(r/mount (ticket-view ticket)
         (.getElementById js/document "app"))
