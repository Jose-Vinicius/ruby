require "./lib/validadorcobranca/validador"
require "./lib/validadorcobranca/user"

describe Cobranca do # rubocop:disable Metrics/BlockLength
  let(:user_inactive) { User.new(1, "basic", "inativo", 3) }
  let(:user_negative_use) { User.new(1, "basic", "ativo", -3) }
  let(:user_invalid_plan) { User.new(1, "batata", "ativo", 3) }
  let(:user_multiple_errors) { User.new(1, "batata", "inativo", -3) }
  let(:user) { User.new(1, "basic", "ativo", 7) }

  describe "#gerar_cobranca" do # rubocop:disable Metrics/BlockLength
    context "when billing is invalid" do
      subject(:cobranca) { described_class.new(user_inactive) }
      it "returns an error object" do
        expect(cobranca.gerar_cobranca).to have_key(:sucess)
        expect(cobranca.gerar_cobranca).to have_key(:messages)
      end
    end

    context "when user is inactive" do
      subject(:cobranca) { described_class.new(user_inactive) }

      it "should indicate an unsuccessful billing attempt" do
        expect(cobranca.gerar_cobranca).to include(sucess: false)
      end

      it "should include a message about inactive user being
     disallowed" do
        expect(cobranca.gerar_cobranca[:messages][0]).to match(/um usuario inativo/)
      end
    end

    context "when use is negative" do
      subject(:cobranca) { described_class.new(user_negative_use) }

      it "should indicate an unsuccessful billing attempt" do
        expect(cobranca.gerar_cobranca).to include(sucess: false)
      end

      it "should include a message about negative system usage being
     disallowed" do
        expect(cobranca.gerar_cobranca[:messages][0]).to match(/uso negativo do sistema/)
      end
    end

    context "when plan is invalid" do
      subject(:cobranca) { described_class.new(user_invalid_plan) }
      it "should indicate an unsuccessful billing attempt" do
        expect(cobranca.gerar_cobranca).to include(sucess: false)
      end

      it "should include a message about invalide plan being
     disallowed" do
        expect(cobranca.gerar_cobranca[:messages][0]).to match(/plano invalido/)
      end
    end

    context "when user is valid" do
      subject(:cobranca) { described_class.new(user) }

      it "should indicate an successful billing attempt" do
        expect(cobranca.gerar_cobranca).to include(sucess: true)
      end

      it "should include a message about sucess register billing" do
        expect(cobranca.gerar_cobranca[:message]).to match(/registrada com sucesso/)
      end

      it "return billing object with userId and billingValue" do
        expect(cobranca.gerar_cobranca[:billing]).to include(userId: 1)
        expect(cobranca.gerar_cobranca[:billing]).to include(billignValue: 70.00)
      end
    end

    context "when billing have multiples errors" do
      subject(:cobranca) { described_class.new(user_multiple_errors) }

      it "return object with multiples errors message" do
        expect(cobranca.gerar_cobranca[:messages]).to include(/um usuario inativo/)
        expect(cobranca.gerar_cobranca[:messages]).to include(/uso negativo do sistema/)
        expect(cobranca.gerar_cobranca[:messages]).to include(/plano invalido/)
      end

      it "return the number of errors that should occur" do
        expect(cobranca.gerar_cobranca[:messages].length).to eql(3)
      end
    end
  end

  describe "#user_active?" do
    context "when user is active" do
      subject(:cobranca) { described_class.new(user) }
      it "returns true" do
        expect(cobranca.user_active?).to be(true)
      end
    end

    context "when user is inactive" do
      subject(:cobranca) { described_class.new(user_inactive) }
      it "returns false" do
        expect(cobranca.user_active?).to be(false)
      end
    end
  end
end
