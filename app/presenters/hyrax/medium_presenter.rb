# frozen_string_literal: true

# Generated via
#  `rails generate hyrax:work Medium`
module Hyrax
  class MediumPresenter < Hyrax::WorkShowPresenter
    delegate :genre, :time_period, :required_software, :note, to: :solr_document
  end
end
