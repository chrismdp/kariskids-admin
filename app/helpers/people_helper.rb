module PeopleHelper
  def person_section_header(type_name)
    content_tag(:h1, "Edit #{type_name} for #{@person.name}")
  end

  def person_form_for(type_name)
    concat person_section_header(type_name)
    form_for @person, :html => { :multipart => true } do |form|
      yield(form)
      concat form.submit("Save")
      concat " or "
      concat link_to("cancel", person_path(@person))
    end
  end

  def output_fields_for(object)
    return if object.nil?
    outputter = FieldOutputter.new(object)
    yield outputter
    nil
  end

  class FieldOutputter < ActionView::Base

    def initialize(object)
      @object = object
    end

    def text(field_name, options = {})
      value = @object.send(field_name)
      return nil if value.blank?
      output(field_name, simple_format(value), options)
    end

    def boolean(field_name, options = {})
      output(field_name, @object.send(field_name) ? "Yes" : "No", options)
    end

    def output(field_name, field_value, options = {})
      return nil if field_value.blank?
      options[:label_name] ||= field_name.humanize
      options[:class_name] ||= options[:label_name].parameterize

      content_tag(:div) do
        content_tag(:span, options[:label_name], :class => "label") +
        content_tag(:span, field_value, :class => options[:class_name])
      end
    end
  end

  def person_image_with_size(person, size)
    return image_tag("default-person-#{size}.png") if person.image.nil?
    image_tag(person.image.thumb("#{size}x#{size}#").url)
  end
end
