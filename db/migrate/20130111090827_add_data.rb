# -*- encoding : utf-8 -*-
class AddData < ActiveRecord::Migration
  def up
    Specialist.create(:admin => false, :fio => "Александрина Елена	Ивановна", :login => "alex_e_i", :mode_id => 1, :password => "1111", :room => 233)
    Specialist.create(:admin => false, :fio => "Галсанова	Елизавета	Санжиевна", :login => "galas_e_s", :mode_id => 2, :password => "1111", :room => 237)
    Specialist.create(:admin => false, :fio => "Егорченкова	Елена	Николаевна", :login => "egorch_e_n", :mode_id => 2, :password => "1111", :room => 234)
    Specialist.create(:admin => false, :fio => "Зенько	Алексей	Геннадьевич", :login => "zenko_a_g", :mode_id => 1, :password => "1111", :room => 235)
    Specialist.create(:admin => false, :fio => "Зыкова	Екатерина	Викторовна", :login => "zikov_e_v", :mode_id => 2, :password => "1111", :room => 220)
    Procedure.create(:delay => 10, :name => "Магнитотерапия (1 поле)")
    Procedure.create(:delay => 20, :name => "Магнитотерапия (2 поля)")

    Procedure.create(:delay => 30, :name => "Классический массаж нижней конечности")
    Procedure.create(:delay => 30, :name => "Классический массаж тазобедренного сустава")

    Procedure.create(:delay => 15, :name => "Лазеротерапия, магнитолазеротерапия (1-2 точки, поле)")
    Procedure.create(:delay => 10, :name => "Синусоидальномодулированные токи (1 поле)")

    Procedure.create(:delay => 15, :name => "Микроволновая терапия (СМВ) (1 поле)")
    Procedure.create(:delay => 10, :name => "Индуктотермия (1 поле)")

    Procedure.create(:delay => 20, :name => "Лимфодренаж (1 поле)")
    Procedure.create(:delay => 15, :name => "Фонофорез (1 поле)")

    SpecialistsProcedures.create(:specialist_id => 2, :procedure_id => 1)
    SpecialistsProcedures.create(:specialist_id => 2, :procedure_id => 2)
    SpecialistsProcedures.create(:specialist_id => 3, :procedure_id => 3)
    SpecialistsProcedures.create(:specialist_id => 3, :procedure_id => 4)
    SpecialistsProcedures.create(:specialist_id => 4, :procedure_id => 5)
    SpecialistsProcedures.create(:specialist_id => 4, :procedure_id => 6)
    SpecialistsProcedures.create(:specialist_id => 5, :procedure_id => 7)
    SpecialistsProcedures.create(:specialist_id => 5, :procedure_id => 8)
    SpecialistsProcedures.create(:specialist_id => 6, :procedure_id => 9)
    SpecialistsProcedures.create(:specialist_id => 6, :procedure_id => 10)

    ProceduresSpecialists.create(:specialist_id => 2, :procedure_id => 1)
    ProceduresSpecialists.create(:specialist_id => 2, :procedure_id => 2)
    ProceduresSpecialists.create(:specialist_id => 3, :procedure_id => 3)
    ProceduresSpecialists.create(:specialist_id => 3, :procedure_id => 4)
    ProceduresSpecialists.create(:specialist_id => 4, :procedure_id => 5)
    ProceduresSpecialists.create(:specialist_id => 4, :procedure_id => 6)
    ProceduresSpecialists.create(:specialist_id => 5, :procedure_id => 7)
    ProceduresSpecialists.create(:specialist_id => 5, :procedure_id => 8)
    ProceduresSpecialists.create(:specialist_id => 6, :procedure_id => 9)
    ProceduresSpecialists.create(:specialist_id => 6, :procedure_id => 10)

  end

  def down
  end
end
