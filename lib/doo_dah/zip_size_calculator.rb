module DooDah
  
  class ZipSizeCalculator
    
    attr_accessor :size, :overhead
    
    def initialize
      @overhead = CentralDirectoryHeader.end_of_central_directory_size
      @size = @overhead
    end
    
    def add_file(name, size=0, crc=0)
      new_overhead = ZipEntry.overhead(name, size, crc) 
      @overhead += new_overhead
      @size += (size + new_overhead)
    end
    
  end
  
end