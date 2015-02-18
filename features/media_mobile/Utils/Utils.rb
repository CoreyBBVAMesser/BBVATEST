class Utils < MediaMobile

 def is_dates_sorted_desc(days_array, months_array)
    size = days_array.size #La última celda no se comprueba porque no se puede acceder al mes ya que lo tapa el layout de Go..
    size = size -1
    for index in 0..size
      next_index=index+1
      if next_index < size
        #puts "Current date: day=#{@days_array[index]}, month=#{@months_array[index]}"
        #puts "Next date: day=#{@days_array[next_index]}, month=#{@months_array[next_index]}"
        if months_array[index] == months_array[next_index]
          if days_array[index] >= days_array[next_index]
            puts "DESC OK: Same month and current cell day is greather than next day cell"
          else
            fail(msg="DESC: Sort error=> Same month and current cell day is lower than before day cell")
          end
        elsif months_array[index] > months_array[next_index]
          puts "DESC OK: month in current cell lower than month in next cell"
        else
          fail(msg="DESC: Sort error=> Current cell month greater than next month cell")
        end
      end
    end
end

def is_dates_sorted_asc(days_array, months_array)
    size = days_array.size #La última celda no se comprueba porque no se puede acceder al mes ya que lo tapa el layout de Go..
    size = size -1
  for index in 0..size
      next_index=index+1
    if next_index < size
        #puts "Current date: day=#{@days_array[index]}, month=#{@months_array[index]}"
        #puts "Next date: day=#{@days_array[next_index]}, month=#{@months_array[next_index]}"
        if months_array[index] == months_array[next_index]
          if days_array[index] <= days_array[next_index]
            puts "ASC: Same month and current cell day is greater or equal than before day cell"
          else
            fail(msg="ASC: Sort error=> Same month and current cell day is lower than before day cell")
          end
        elsif months_array[index] < months_array[next_index]
          puts "ASC OK: month in current cell greather than month in next cell"
        else
          fail(msg="ASC: Sort error=> month in current cell lower than month in next cell")
        end
     end
   end
end

end