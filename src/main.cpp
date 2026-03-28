
#include <RE/Skyrim.h>
#include <SKSE/SKSE.h>

namespace RadarNative
{
	float CastRayDistance(RE::hkpWorld* world, const RE::NiPoint3& origin, const RE::NiPoint3& dir, float maxDist)
	{
		float scale = RE::bhkWorld::GetWorldScale();

		RE::NiPoint3 from = origin * scale;
		RE::NiPoint3 end = (origin + dir * maxDist) * scale;

		RE::hkpWorldRayCastInput input;
		RE::hkpWorldRayCastOutput output;

		input.from = RE::hkVector4(from.x, from.y, from.z, 0);
		input.to = RE::hkVector4(end.x, end.y, end.z, 0);
		input.enableShapeCollectionFilter = false;

		world->CastRay(input, output);

		if (output.HasHit()) {
			return output.hitFraction * maxDist;
		}
		return -1.0f;
	}

	std::vector<float> RadarRayCast(RE::StaticFunctionTag*, float maxDist)
	{
		std::vector<float> result = { -1.0f, -1.0f, -1.0f };

		auto* player = RE::PlayerCharacter::GetSingleton();
		if (!player) return result;

		auto* cell = player->GetParentCell();
		if (!cell) return result;

		auto* bhk = cell->GetbhkWorld();
		if (!bhk) return result;

		auto* hkWorld = bhk->GetWorld1();
		if (!hkWorld) return result;

		RE::NiPoint3 pos = player->GetPosition();
		pos.z += 120.0f;

		float h = player->GetAngleZ();
		float sinH = std::sin(h);
		float cosH = std::cos(h);

		RE::NiPoint3 forward(sinH, cosH, 0);
		RE::NiPoint3 left(-cosH, sinH, 0);
		RE::NiPoint3 right(cosH, -sinH, 0);

		result[0] = CastRayDistance(hkWorld, pos, forward, maxDist);
		result[1] = CastRayDistance(hkWorld, pos, left, maxDist);
		result[2] = CastRayDistance(hkWorld, pos, right, maxDist);

		return result;
	}

	std::int32_t PlaySoundAt(RE::StaticFunctionTag*, RE::TESSound* sound, float x, float y, float z, float volume)
	{
		if (!sound) {
			REX::INFO("PlaySoundAt: sound is null");
			return -1;
		}
		if (!sound->descriptor) {
			REX::INFO("PlaySoundAt: descriptor is null");
			return -1;
		}

		auto* audio = RE::BSAudioManager::GetSingleton();
		if (!audio) {
			REX::INFO("PlaySoundAt: audio manager is null");
			return -1;
		}

		RE::BSSoundHandle handle;
		bool ok = audio->GetSoundHandle(handle, sound->descriptor, 16);

		if (!handle.IsValid()) return -1;

		handle.SetPosition(RE::NiPoint3(x, y, z));
		handle.SetVolume(volume);
		bool played = handle.Play();

		REX::INFO("PlaySoundAt: ok={} played={} pos=({},{},{}) vol={}", ok, played, x, y, z, volume);

		return handle.soundID;
	}

	bool Register(RE::BSScript::IVirtualMachine* vm)
	{
		vm->RegisterFunction("RadarRayCast", "AccessibilityRadarNative", RadarRayCast);
		vm->RegisterFunction("PlaySoundAt", "AccessibilityRadarNative", PlaySoundAt);
		REX::INFO("Registered AccessibilityRadarNative functions");
		return true;
	}
}

SKSE_PLUGIN_LOAD(const SKSE::LoadInterface* a_skse)
{
	SKSE::Init(a_skse);

	auto* papyrus = SKSE::GetPapyrusInterface();
	if (papyrus) {
		papyrus->Register(RadarNative::Register);
	}

	REX::INFO("SkyrimAccessibility native plugin loaded");
	return true;
}
