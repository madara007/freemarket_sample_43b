class RegionsController < ApplicationController
  def index
    area
  end

  def show
    @region = Region.find(params[:id])
  end

  private

  def area
    @hokkaido = Region.region(1)
    @tohoku = Region.region(2, 3, 4, 5, 6, 7)
    @kanto = Region.region(8, 9, 10, 11, 12, 13, 14)
    @hokuriku = Region.region(15, 16, 17, 18)
    @tyubu = Region.region(19, 20, 21, 22, 23)
    @kinki = Region.region(24, 25, 26, 27, 28, 29, 30)
    @tyugoku = Region.region(31, 32, 33, 34, 35)
    @sikoku = Region.region(36, 37, 38, 39)
    @kyusyu = Region.region(40, 41, 42, 43, 44, 45, 46, 47)
  end
end
