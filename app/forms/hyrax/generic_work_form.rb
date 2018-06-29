# frozen_string_literal: true

# Generated via
#  `rails generate hyrax:work GenericWork`
module Hyrax
  class GenericWorkForm < Hyrax::Forms::WorkForm
    self.model_class = ::GenericWork

    ## Adding custom descriptive metadata terms
    self.terms += %i[time_period required_software
                     note geo_subject]

    ## Adding terms needed for the special DOI form tab
    # self.terms += %i(doi doi_assignment_strategy existing_identifier)

    ## Adding terms college and department
    self.terms += %i[college department]

    ## Removing terms that we don't use
    self.terms -= %i[keyword source contributor description date_created]

    ## Setting custom required fields
    self.required_fields = %i[title creator description]

    ## Adding above the fold on the form without making this required
    def primary_terms
      required_fields + %i[publisher subject college department geo_subject time_period
                           language required_software note related_url]
    end
  end
end
