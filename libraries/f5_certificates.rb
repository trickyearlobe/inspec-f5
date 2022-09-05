require 'date'

class F5Certificates < Inspec.resource(1)
  name "f5_certificates"

  filter_table = FilterTable.create
  .register_column(:cities,           field: :city)
  .register_column(:common_names,     field: :common_name)
  .register_column(:countries,        field: :country)
  .register_column(:emails,           field: :email)
  .register_column(:expirations,      field: :expiration)
  .register_column(:fingerprints,     field: :fingerprint)
  .register_column(:issuers,          field: :issuer)
  .register_column(:keysizes,         field: :keysize)
  .register_column(:keytypes,         field: :keytype)
  .register_column(:names,            field: :name)
  .register_column(:organizations,    field: :organization)
  .register_column(:ous,              field: :ou)
  .register_column(:states,           field: :state)
  .register_column(:valid_days,       field: :valid_days)

  filter_table.install_filter_methods_on_resource(self, :fetch_data)

  def fetch_data
    @rawdata ||= inspec.backend.get("/mgmt/tm/sys/crypto/cert")["items"].map do |e|
      expiration = Date.parse(e['apiRawValues']['expiration'])
      valid_days = (expiration - DateTime.now).to_i
      {
        city:         e['city'],
        common_name:  e['commonName'],
        country:      e['country'],
        email:        e['emailAddress'],
        expiration:   expiration,
        fingerprint:  e['fingerprint'],
        issuer:       e['apiRawValues']['issuer'],
        keysize:      e['apiRawValues']['certificateKeySize'].to_i,
        keytype:      e['apiRawValues']['publicKeyType'],
        name:         e['name'],
        organization: e['organization'],
        ou:           e['ou'],
        state:        e['state'],
        valid_days:   valid_days,
      }
    end
  end
end
