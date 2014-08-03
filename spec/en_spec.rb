require 'spec_helper'

require 'en'

describe EN do
  subject(:env) { described_class }

  describe '.fetch' do
    context 'variable exists' do
      before { ENV['A'] = 'A' }
      after  { ENV.delete 'A' }

      it 'returns its value without block' do
        expect(env.fetch(:a)).to eq('A')
      end

      it 'returns its value with block' do
        expect(env.fetch(:a) { '1' }).to eq('A')
        expect(env.fetch(:a) { fail }).to eq('A')
      end
    end

    context 'variable does not exist' do
      it 'returns nil without block' do
        expect(env.fetch(:a)).to be(nil)
      end

      it 'returns block value with block' do
        expect(env.fetch(:a) { '1' }).to eq('1')
        expect { env.fetch(:a) { fail } }.to raise_error
      end
    end
  end

  describe '.fetch_int' do
    context 'variable exists' do
      context 'numeric' do
        before { ENV['A'] = '1' }
        after  { ENV.delete 'A' }

        it 'returns its integer value' do
          expect(env.fetch_int(:a)).to eq(1)
          expect(env.fetch_int(:a) { 2 }).to eq(1)
          expect(env.fetch_int(:a) { fail }).to eq(1)
        end
      end

      context 'not numeric' do
        before { ENV['A'] = 'A' }
        after  { ENV.delete 'A' }

        it 'fails with or without block' do
          expect { env.fetch_int(:a) }.to raise_error
          expect { env.fetch_int(:a, 'wrong') }.to raise_error('wrong')
          expect { env.fetch_int(:a) { 2 } }.to raise_error
        end
      end

      context 'not present' do
        it 'fails without block' do
          expect { env.fetch_int(:a) }.to raise_error
          expect { env.fetch_int(:a, 'wrong') }.to raise_error('wrong')
        end

        it 'returns block value when numeric' do
          expect(env.fetch_int(:a) { 1 }).to eq(1)
        end

        it 'fails when block value is not numeric' do
          expect { env.fetch_int(:a) { 'A' } }.to raise_error
          expect { env.fetch_int(:a, 'wrong') { 'A' }}.to raise_error('wrong')
        end
      end
    end
  end

  describe '.fetch_float' do
    context 'variable exists' do
      context 'numeric' do
        before { ENV['A'] = '1.2' }
        after  { ENV.delete 'A' }

        it 'returns its float value' do
          expect(env.fetch_float(:a)).to eq(1.2)
          expect(env.fetch_float(:a) { 2 }).to eq(1.2)
          expect(env.fetch_float(:a) { fail }).to eq(1.2)
        end
      end

      context 'not numeric' do
        before { ENV['A'] = 'A' }
        after  { ENV.delete 'A' }

        it 'fails with or without block' do
          expect { env.fetch_float(:a) }.to raise_error
          expect { env.fetch_float(:a, 'wrong') }.to raise_error('wrong')
          expect { env.fetch_float(:a) { 2 } }.to raise_error
        end
      end

      context 'not present' do
        it 'fails without block' do
          expect { env.fetch_float(:a) }.to raise_error
          expect { env.fetch_float(:a, 'wrong') }.to raise_error('wrong')
        end

        it 'returns block value when numeric' do
          expect(env.fetch_float(:a) { 1 }).to eq(1.0)
        end

        it 'fails when block value is not numeric' do
          expect { env.fetch_float(:a) { 'A' } }.to raise_error
          expect { env.fetch_float(:a, 'wrong') { 'A' }}.to raise_error('wrong')
        end
      end
    end
  end
end
