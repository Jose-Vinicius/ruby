# a
class Cobranca
  attr_accessor :use, :plan, :limit, :status, :increase, :price

  def initialize(user)
    self.use = user.use
    self.plan = user.plan
    self.limit = plan_limit(user.plan)
    self.status = user.status
    self.increase = plan_increase(user.plan)
    self.price = plan_value(user.plan)
  end

  def valide_plan?
    %w[pro basic].include?(plan) || false
  end

  def valide_use?
    use.positive? || false
  end

  def valide_active_user?
    %w[ativo inativo].include?(status) && user_active? || false
  end

  def user_active?
    status == "ativo" || false
  end

  def plan_value(plan)
    plan == "basic" ? 50.00 : 100.00
  end

  def plan_limit(plan)
    plan == "basic" ? 5 : 20
  end

  def plan_increase(plan)
    plan == "basic" ? 10.00 : 5
  end

  def message_error(data)
    case data
    when :plan then "Não é possivel gerar uma cobrança para um plano invalido"
    when :use then "Não é possivel gerar uma cobrança para uso negativo do sistema"
    when :status then "Não é possivel gerar uma cobrança para um usuario inativo"
    end
  end

  def sucess_message(data)
    { "sucess": true, "message": "Cobrança registrada com sucesso", "billing": { "userId": 1, "billignValue": data[:billing] } } # rubocop:disable Layout/LineLength
  end

  def error_message
    validation_error_list = [
      %i[valide_use? use],
      %i[valide_active_user? status],
      %i[valide_plan? plan]
    ]
    error_list = validation_error_list.map do |validation, type|
      message_error(type) unless send(validation)
    end.compact

    { "sucess": error_list.length.positive? ? false : true, "messages": error_list }
  end

  def gerar_cobranca
    return error_message if error_message[:sucess] == false

    billing_value = ((limit - use).abs * increase) + price

    sucess_message({ "billing": billing_value })
  end
end
