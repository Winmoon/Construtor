class HomeController < ApplicationController

  def index

    @newsletter = Newsletter.new

    plan = {
        code: "plano01",
        name: "Plano Especial",
        description: "Descricao do Plano Especial",
        amount: 990,
        setup_fee: 500,
        max_qty: 1,
        interval: {
            length: 1,
            unit: "MONTH"
        },
        billing_cycles: 12
    }

    begin
      request = Moip::Assinaturas::Plan.create(plan)

    rescue => e
      puts e

    end

  end
end
