class AttendanceService

  def initialize()
  end

  def get_first_attendance(scheduller,current_user)
    first_attendance  = current_user.company.attendances.order(:updated_at).where("client_id = ? and professional_id = ?",scheduller.client_id, scheduller.professional_id).first

    if not first_attendance
      first_attendance = current_user.company.attendances.order(:updated_at).where("client_id = ? ",scheduller.client_id).first
    end
  end

  def get_history_list(scheduller,current_user)
    history_list = current_user.company.attendances.order(:updated_at).
                    where("client_id = ? ",scheduller.client_id)
  end

  def get_attendance_day(current_user)
    @schedullers = current_user.company.schedullers.order(:time_marked).
    where("date = ? ",Date.today) ;
  end

  def get_attendance_filter_day(current_user,date_find,professional_id)
    @schedullers = current_user.company.schedullers.order(:time_marked).
    where("date = ? and professional_id = ?",date_find.to_date,professional_id) ;
  end

  def build_filter_attendance(current_user)
    @attendances = current_user.company.attendances
    if params['agreement_id']
      @attendances = @attendances.where('agreement_id = ?', params['agreement_id'])
    end
    if params['professional_id']
      @attendances = @attendances.where('professional_id = ?', params['professional_id'])
    end
    if params['client_id'].to_i > 0
      @attendances = @attendances.where('client_id = ?', params['client_id'])
    end
    if params['date_begin'] != ''
      @attendances = @attendances.where('date >= ?', params['date_begin'].to_date)
    end
    if params['date_end'] != ''
      @attendances = @attendances.where('date <= ?', params['date_end'].to_date)
    end
  end

end
