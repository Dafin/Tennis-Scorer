# frozen_string_literal: true

# Test spec for Tech Test Dafin Aziz 2021

require 'minitest/autorun'
require 'rspec/expectations/minitest_integration'
require_relative '../lib/game'

describe 'Game' do
  before do
    @server = 'J'
    @receiver = 'B'
    @game = Game.new(@server, @receiver)
  end

  describe 'Test Case One', 'Example game play data after four balls played' do
    it 'adds a point to the servers score' do
      @game.point_to(@server)

      _(@game.points_won).must_equal  %w(J)
    end

    it 'adds another point to the servers score, consecutively ' do
      @game.point_to(@server)
      @game.point_to(@server)

      _(@game.points_won).must_equal %w(J J)
    end
  end

  it 'adds points to the servers and recievers score' do
    @game.point_to(@server)
    @game.point_to(@server)
    @game.point_to(@receiver)

    _(@game.points_won).must_equal %w(J J B)
  end

  it 'adds spoint to the server and recievers score' do
    @game.point_to(@server)
    @game.point_to(@server)
    @game.point_to(@receiver)
    @game.point_to(@server)

    _(@game.points_won).must_equal %w(J J B J)
  end

  describe 'When the score "3-1" ' do
    it 'displays the score in tennis speak' do
      @game.point_to(@server)
      @game.point_to(@server)
      @game.point_to(@receiver)
      @game.point_to(@server)

      _(@game.score).must_equal 'Score: Forty, fifteen'
    end
  end  

  describe 'Test Case Two', 'Example game play data after seven balls played' do
    it 'adds a point to the servers score' do
      @game.point_to(@server)
      @game.point_to(@receiver)
      @game.point_to(@server)
      @game.point_to(@receiver)
      @game.point_to(@server)
      @game.point_to(@receiver)
      @game.point_to(@receiver)

      _(@game.score).must_equal 'Score: Advantage, B'
    end
  end

  describe 'Test Case Three', 'Example game play data after seven balls played' do
    it 'adds a point to the servers score' do
      @game.point_to(@server)
      @game.point_to(@server)
      @game.point_to(@server)
      @game.point_to(@receiver)
      @game.point_to(@receiver)
      @game.point_to(@receiver)
      @game.point_to(@receiver)
      @game.point_to(@receiver)

      _(@game.score).must_equal 'Score: Game, B'
    end
  end

  describe 'Rule 3', 'Deuce condition' do
    it 'adds a point to the servers score' do
      @game.point_to(@server)
      @game.point_to(@server)
      @game.point_to(@server)
      @game.point_to(@receiver)
      @game.point_to(@receiver)
      @game.point_to(@receiver)
    
      _(@game.score).must_equal 'Score: deuce'
    end
  end
  # TODO - Test for longer games/ more edge cases 
end
