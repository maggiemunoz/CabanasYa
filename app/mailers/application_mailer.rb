# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'cabanasyacorreo@gmail.com'
  layout 'mailer'
end
