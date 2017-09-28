# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  TAB = "\t".freeze
  NEWLINE = "\n".freeze

  def row_to_table(headers, row)
    row.map.with_index { |cell, i| [headers[i], cell] }.to_h
  end

  def take_tsv(tsv)
    rows = tsv.split(NEWLINE).map { |line| line.split(TAB) }
    headers = rows.first
    @data = rows[1..-1].map { |row| row_to_table(headers, row) }
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    tsv = ''
    tsv << @data[0].keys.join(TAB) << NEWLINE
    @data.each { |item| tsv << item.values.join(TAB) << NEWLINE }
    tsv
  end
end
