module PatrimonioHelper
  def can_do?(patrimonio, action)
    policy(patrimonio).send(action)
  end
end
