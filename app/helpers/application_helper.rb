module ApplicationHelper

  def get_quarter(time) #获取季度信息
    nowtime = time.to_time
    year = nowtime.year
    month = nowtime.month
    quarter = '0'
    begintime = time
    endtime = time
    quarter1 = [1,2,3]
    quarter2 = [4,5,6]
    quarter3 = [7,8,9]
    if quarter1.include?(month)
      quarter = '01'
      begintime = (year.to_s + '-01-01 00:00:00').to_time
      endtime = (year.to_s + '-03-31 23:59:59').to_time
    elsif quarter2.include?(month)
      quarter = '02'
      begintime = (year.to_s + '-04-01 00:00:00').to_time
      endtime = (year.to_s + '-06-30 23:59:59').to_time
    elsif quarter3.include?(month)
      quarter = '03'
      begintime = (year.to_s + '-07-01 00:00:00').to_time
      endtime = (year.to_s + '-09-30 23:59:59').to_time
    else
      quarter = '04'
      begintime = (year.to_s + '-10-01 00:00:00').to_time
      endtime = (year.to_s + '-21-31 23:59:59').to_time
    end
    name = ''
    if quarter == '01'
      name = '一季度'
    elsif quarter == '02'
      name = '二季度'
    elsif quarter == '03'
      name = '三季度'
    else
      name = '四季度'
    end
    res = year.to_s + quarter + ',' + name + ',' + begintime.to_s + ',' + endtime.to_s
  end

end
