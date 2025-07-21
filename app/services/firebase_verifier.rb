# app/services/firebase_verifier.rb
class FirebaseVerifier
  def self.verify(token)
    FirebaseIdToken::Certificates.request unless FirebaseIdToken::Certificates.public_keys.present?
    FirebaseIdToken::Signature.verify(token)
  rescue => e
    Rails.logger.error("Firebase token verification failed: #{e.message}")
    nil
  end
end
