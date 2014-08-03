require 'spec_helper'

require 'en/namespace'

describe EN::Namespace do
  subject(:env) { described_class.new(:test) }

  describe '.fetch' do
    context 'variable exists' do
      before { ENV['TEST_A'] = 'A' }
      after  { ENV.delete 'TEST_A' }

      it 'returns its value without block' do
        expect(env.fetch(:a)).to eq('A')
      end
    end
  end
end
