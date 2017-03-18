class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.integer :company_id
      t.integer :professional_id
      t.integer :client_id
      t.integer :user_id
      t.integer :agreement_id
      t.datetime :date
      t.string :acompanhante
      t.string :status
      t.text :antecedentes
      t.text :habitos
      t.text :isda
      t.text :exame_fisico
      t.text :diagnostico
      t.text :conduta
      t.text :hma
      t.time :time_begin
      t.time :time_end
      t.string :tipo_atendimento
      t.text :medicamentos
      t.text :outras_informacoes
      t.timestamps null: false
    end
  end
end
