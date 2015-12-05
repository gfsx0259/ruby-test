module ApplicationHelper
  def truncate_title(text, length = 30, end_string = '...')
    return text if text.size <= length
    last_space = text[0..length].rindex(/\s/)
    #Если пробел находится близко к концу, то не пишем последнее слово ( чт...)
    if last_space > length - 5
      text[0..last_space.to_i-1]+end_string
    else
      text[0..length]+end_string
    end
  end
end
