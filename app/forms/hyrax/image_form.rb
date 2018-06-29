# frozen_string_literal: true

# Generated via
#  `rails generate hyrax:work Image`
module Hyrax
  class ImageForm < Hyrax::Forms::WorkForm
    self.model_class = ::Image

    ## Adding custom descriptive metadata terms
    self.terms += %i[genre time_period
                     required_software note geo_subject]

    ## Adding terms needed for the special DOI form tab
    # self.terms += %i(doi doi_assignment_strategy existing_identifier)

    ## Adding terms college and department
    self.terms += %i[college department]

    ## Removing terms that we don't use
    self.terms -= %i[keyword source contributor]

    ## Setting custom required fields
    self.required_fields = %i[title creator description]

    ## Adding above the fold on the form without making this required
    def primary_terms
      required_fields + %i[college department publisher genre subject geo_subject time_period
                           language required_software note related_url]
    end
  end
end
