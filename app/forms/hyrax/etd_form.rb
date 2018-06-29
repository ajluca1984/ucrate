# frozen_string_literal: true

# Generated via
#  `rails generate hyrax:work Etd`
module Hyrax
  class EtdForm < Hyrax::Forms::WorkForm
    self.model_class = ::Etd

    ## Adding custom descriptive metadata terms
    self.terms += %i[genre time_period required_software note
                     degree advisor committee_member geo_subject
                     etd_publisher]

    ## Adding terms needed for the special DOI form tab
    # self.terms += %i(doi doi_assignment_strategy existing_identifier)

    ## Adding terms college and department
    self.terms += %i[college department]

    ## Removing terms that we don't use
    self.terms -= %i[keyword source contributor publisher]

    ## Setting custom required fields
    self.required_fields = %i[title creator description college department advisor]

    ## Adding above the fold on the form without making this required
    def primary_terms
      required_fields + %i[committee_member degree
                           etd_publisher genre subject
                           geo_subject time_period language
                           required_software note related_url]
    end
  end
end
