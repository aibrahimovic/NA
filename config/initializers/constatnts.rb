class Constant
  
  def self.student_number_in_group
  	[15, 20]
  end

  def self.professor_norm
  	{:lectures => [4,6], :preparations => [8,10], :consultations => 10}
  end

  def self.assistent_norm
  	{:tutorials => 12, :preparations => 10, :consultations => 10}
  end

  def self.group_sizes
    {:more_exercises => 15, :less_exercises => 20}
  end

  def self.study_program
  	['RI-I', 'RI-II', 'RI-III', 'EE-I', 'EE-II', 'EE-III', 'AiE-I', 'AiE-II', 'AiE-III', 'TK-I', 'TK-II', 'TK-III']
  end

end

