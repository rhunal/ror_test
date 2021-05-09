class BaseGrid
  include Datagrid

  self.default_column_options = {
    # Uncomment to disable the default order
    # order: false,
    # Uncomment to make all columns HTML by default
    # html: true,
  }
  # Enable forbidden attributes protection
  # self.forbidden_attributes_protection = true

  # def to_csv
  #   _hash = "#{SecureRandom.hex}_daily_sales"
  #   _path = "/tmp/#{_hash}.csv"

  #   assets.copy_to _path
  #   File.read(_path)
  # end

  def self.date_column(name, *args)
    column(name, *args) do |model|
      format(block_given? ? yield : model.send(name)) do |date|
        if date.present?
          date.strftime("%d/%m/%Y")
        end
      end
    end
  end

  def self.time_column(name, *args)
    column(name, *args) do |model|
      format(block_given? ? yield : model.send(name)) do |time|
        if time.present?
          time.strftime("%H:%M")
        end
      end
    end
  end

  def self.datetime_column(name, *args)
    column(name, *args) do |model|
      format(block_given? ? yield : model.send(name)) do |datetime|
        if datetime.present?
          datetime.strftime("%d/%b/%Y %I:%M %p")
        end
      end
    end
  end
end
