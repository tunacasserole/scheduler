class Hash
  def delete_blanks
    delete_if{|k, v| v.nil? or (v.instance_of?(Hash) and v.delete_blank.empty?)}
  end
  def downcase_keys
    keys.each do |k|
      store(k.downcase, Array === (v = delete(k)) ? v.map(&:downcase_key) : v)
    end
    self
  end
end
