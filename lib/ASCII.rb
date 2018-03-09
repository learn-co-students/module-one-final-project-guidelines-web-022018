
require "pry"

ASCIIS = ' .,:;ris235ShHXMAG9&#B@'

# class ASCIIConverter
#
#   attr_accessor :path, :image
#
#   def initialize(filepath)
#     @path = filepath
#     @image = MiniMagick::Image.open(path)
#   end
# # chars are 7:10
#   def stretch
#     res = self.resolution
#     goalres = [res[0]-(res[0] % 7), res[1]-(res[1] % 10)]
#     str = golares.join("x")
#     image.resize str
#   end
#
# end

class Array
  def greypixels
    pixels = self
    pixels.each_with_index do |row, r|
      row.each_with_index do |pixel, p|
        # pixels[r][p] = (pixel[0] + pixel[1] + pixel[2]) / 3
        pixels[r][p] = 0.3 * pixel[0] + 0.59 * pixel[1] + 0.11 * pixel[2]
      end
    end
  end

  def reduce_res(res)
    if res == 1
      return self
    else
      origin = self
      out = []
      res_origin = [origin[0].length, origin.length] #cols, rows
      row = [0,2 * (res-1)]
      col = [0,1 * (res-1)]
      blocksize = 2 * 1 * (res - 1) * (res - 1)
      y = 0
      x = 0
      rbounds = (row[0] + ((row[1]) * y))..(row[1] + ((row[1] + 1) * y)-1)
      cbounds = (col[0] + ((col[1]) * x))..(col[1] + ((col[1] + 1) * x)-1)

      while rbounds.max < res_origin[1]
        out << []
        while cbounds.max < res_origin[0]
          out[y] << 0
          for r in rbounds
            for c in cbounds
              # begin
              #   out[y][x] + origin[r][c]
              # rescue TypeError
              #   puts "r = #{r}"
              #   puts "c = #{c}"
              #   puts "x = #{x}"
              #   puts "y = #{y}"
              #   puts "out[y][x] = #{out[y][x]}"
              #   puts "origin[r][c] = #{origin[r][c]}"
              #else
                out[y][x] += origin[r][c]
              #end
            end
          end
          out[y][x] = out[y][x] / blocksize
          x += 1
          cbounds = (col[0] + ((col[1] + 1) * x))..(col[1] + ((col[1] + 1) * x))
        end
        x = 0
        cbounds = (col[0] + ((col[1] + 1) * x))..(col[1] + ((col[1] + 1) * x))
        y += 1
        rbounds = (row[0] + ((row[1] + 1) * y))..(row[1] + ((row[1] + 1) * y))
      end
    end
    out
  end

  def normalize
    maximum = self.flatten.max
    minimum = self.flatten.min
    range = maximum - minimum
    if range == 0
      range = 255
    end
    origin = self
    origin.each_with_index do |row, r|
      row.each_with_index do |pixel, p|
        origin[r][p] = ((pixel - minimum) / range) * 255
      end
    end
    origin
  end


  def get_text
    origin = self
    origin.each_with_index do |row, r|
      row.each_with_index do |pixel, p|
          check = origin[r][p]
          origin[r][p] = ASCIIS[(check / (255.0 / (ASCIIS.length - 1)))]
          if origin[r][p] == nil
            binding.pry
          end
      end
    end
    origin
  end

  def print_text
    text = self
    text.each_with_index do |row, r|
      row.each_with_index do |pixel, p|
        print text[r][p]
      end
      print "\n"
    end
  end

  def print_to_file(file)
    text = self
    output = ""
    text.each_with_index do |row, r|
      row.each_with_index do |pixel, p|
        output += text[r][p]
      end
      output += "\n"
    end
    File.write(file, output)
  end

end

def convert_to_ascii(image,res)
  image.get_pixels.greypixels.reduce_res(res).normalize.get_text.print_text
end

def generate_text_frame(image,res)
  image.get_pixels.greypixels.reduce_res(res).normalize.get_text
end

def compress_text_frame(textframe)
  frame = ""
  textframe.each_with_index do |row, r|
    row.each_with_index do |pixel, p|
      frame += textframe[r][p]
    end
    frame += "\n"
  end
  frame
end


def play_ascii_video(textframes,fr)
  textframes.each do |frame|
    puts `printf '\33c\e[3J'`
    print frame
    sleep(1/fr)
  end
end

# puts "Specify the full path of an image file from which to make ASCII art:"
# path = gets.chomp
# outfile = path.split(".")[0] + ".txt"
# while !(res >=1 && res <=10) do
#   puts "Specify the resolution factor for the conversion. This should be an integer from 1 to 10, where higher numbers represent larger loss of quality."
#   res = gets.chomp.to_i
# end
def get_path(json)
  if json["data"]["results"][0].keys.include?("thumbnail")
    path = json["data"]["results"][0]["thumbnail"]["path"] + "." + json["data"]["results"][0]["thumbnail"]["extension"]
  else
    nil
  end
end
