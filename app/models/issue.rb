class Issue
  after_save :set_position_to_backlog_rank
  
  def set_position_to_backlog_rank
    if rank = custom_values.find(:first, :conditions => "custom_fields.name = 'Backlog Rank'", :include => :custom_field)
      self.position = rank.value
      save!
    end
  end
end