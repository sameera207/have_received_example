class DcUniverse
  attr_reader :super_hero

  def initialize(super_hero)
    @super_hero = super_hero
  end

  def call
    super_hero.real_name
  end
end

class SuperMan
  def real_name(super_power)
    'Sam'
  end
end

# using just double and receive
RSpec.describe DcUniverse do
  subject { DcUniverse.new(super_hero) }

  let(:super_hero) { double('SuperMan', real_name: 'Sam') }
  it 'calls the real name' do
    expect(super_hero).to receive(:real_name)
    subject.call
  end
end

# using just instance_double and have_received
RSpec.describe DcUniverse do
  subject { DcUniverse.new(super_hero) }

  let(:super_hero) { instance_double('SuperMan', real_name: 'Sam') }

  it 'calls the real name' do
    subject.call
    expect(super_hero).to have_received(:real_name)
  end
end




