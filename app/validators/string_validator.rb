class StringValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if (value.blank?)
      record.errors[attribute] << (options[:message] || 'cannot be blank')
    elsif (value.length < 2)
      record.errors[attribute] << (options[:message] || 'is too short')
    elsif (value.length > 254)
      record.errors[attribute] << (options[:message] || 'is too long')
    elsif (value =~ /\A.*[$><()].*\z/) # we do not allow these special characters
      record.errors[attribute] << (options[:message] || 'contains invalid characters')
    end
  end
end