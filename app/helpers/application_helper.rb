module ApplicationHelper
  def upload_file(file)
    access_key_id = Rails.application.credentials.aws.s3.access_key_id
    secret_access_key = Rails.application.credentials.aws.s3.secret_access_key
    region = 'ap-southeast-1'
    bucket = Rails.application.credentials.aws.s3.bucket

    Aws.config.update(
      credentials: Aws::Credentials.new(access_key_id, secret_access_key),
      region: region,
    )

    s3 = Aws::S3::Client.new
    object_key = "#{DateTime.now.to_i}-#{file.original_filename}"
    resp = s3.put_object({
                    body: File.open(file),
                    bucket: Rails.application.credentials.aws.s3.bucket,
                    key: object_key,
                  })

    "http://#{bucket}.s3.#{region}.amazonaws.com/#{object_key}"
  end
end
