class SchedullerService
  def set_scheduller(current_user,params)
    if params['id']
      scheduller = Scheduller.find(params['id'])
    else
      scheduller = Scheduller.new
    end
    scheduller.company_id  = current_user.company.id
    scheduller.user_id     = current_user.id
    scheduller.name        = params['client_name']
    scheduller.professional_id = params['professional_id']
    scheduller.date        = params['date']
    scheduller.time_marked = params['time_marked']
    scheduller.time_marked_end = params['time_marked_end']
    scheduller.observation = params['observation']
    scheduller.name        = params['name']
    scheduller.status      = params['status']
    scheduller.celphone    = params['celphone']
    scheduller.phone       = params['phone']
    scheduller.tipo_atendimento = params['tipo_atendimento']
    scheduller.agreement_id = params['agreement_id']

    if(params['client_id'])
      scheduller.client_id   = params['client_id']
    end
    scheduller.save
  end
end
